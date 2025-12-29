using Microsoft.AspNetCore.Identity;
using SimplyShopAPI.Application.Auth.DTOs;
using SimplyShopAPI.Application.Auth.Interfaces;
using SimplyShopAPI.Application.DTOs.Auth;
using SimplyShopAPI.Infrastructure.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Implementation.Auth
{
    public class IdentityService : IIdentityService
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;

        public IdentityService(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public async Task<IdentityResult<object>> RegisterAsync(RegisterRequest request)
        {
            var existing = await _userManager.FindByEmailAsync(request.Email);
            if (existing != null)
            {
                return IdentityResult<object>.Fail("Email is already in use");
            }

            var user = new ApplicationUser
            {
                UserName = request.Email,
                Email = request.Email,
                FirstName = request.FirstName,
                LastName = request.LastName,
                ZipCode = request.ZipCode
            };

            var result = await _userManager.CreateAsync(user, request.Password);

            if (!result.Succeeded)
            {
                var msg = string.Join("; ", result.Errors.Select(e => e.Description));
                return IdentityResult<object>.Fail(msg);
            }

            return IdentityResult<object>.Ok(new object());
        }

        public async Task<IdentityResult<TokenUser>> LoginAsync(LoginRequest request)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                return IdentityResult<TokenUser>.Fail("Invalid credentials.");
            }

            var result = await _signInManager.CheckPasswordSignInAsync(user, request.Password, lockoutOnFailure: false);

            if (!result.Succeeded)
            {
                return IdentityResult<TokenUser>.Fail("Invalid credentials.");
            }

            //var roles = await _userManager.GetRolesAsync(user);

            return IdentityResult<TokenUser>.Ok(new TokenUser
            {
                Id = user.Id,
                Email = user.Email ?? "",
                UserName = user.UserName ?? "",
                FirstName = user.FirstName ?? "",
                LastName = user.LastName ?? "",
                ZipCode = user.ZipCode ?? ""
            });
        }

        public async Task<IdentityResult<TokenUser>> GetUserByIdAsync(string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);

            if (user == null)
            {
                return IdentityResult<TokenUser>.Fail("User not found.");
            }

            return IdentityResult<TokenUser>.Ok(new TokenUser
            {
                Id = user.Id,
                Email = user.Email ?? "",
                UserName = user.UserName ?? "",
                FirstName = user.FirstName ?? "",
                LastName = user.LastName ?? "",
                ZipCode = user.ZipCode ?? ""
            });
        }
    }
}
