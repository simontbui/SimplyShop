using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.DTOs.Auth
{
    public class IdentityResult<T>
    {
        public bool Success { get; set; }
        public string? ErrorMessage { get; set; }
        public T? Data { get; set; }

        public static IdentityResult<T> Ok(T data) =>
            new() { Success = true, Data = data };

        public static IdentityResult<T> Fail(string error) =>
            new() { Success = false, ErrorMessage = error };
    }
}
