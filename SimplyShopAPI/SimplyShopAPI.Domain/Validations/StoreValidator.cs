using FluentValidation;
using FluentValidation.Validators;
using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Validations
{
    public class StoreValidator : AbstractValidator<Store>
    {
        public StoreValidator()
        {
            RuleFor(store => store.StoreName)
                .NotEmpty().WithMessage("Store name cannot be empty.")
                .MaximumLength(100).WithMessage("Store name cannot exceed 100 characters.");
            RuleFor(store => store.StreetAddress)
                .NotEmpty().WithMessage("Street address cannot be empty.")
                .MaximumLength(200).WithMessage("Street address cannot exceed 200 characters.");
            RuleFor(store => store.CityAddress)
                .NotEmpty().WithMessage("City address cannot be empty.")
                .MaximumLength(100).WithMessage("City address cannot exceed 100 characters.");
            RuleFor(store => store.StateAddress)
                .NotEmpty().WithMessage("State address cannot be empty.")
                .MaximumLength(50).WithMessage("State address cannot exceed 50 characters.");
            RuleFor(store => store.ZipAddress)
                .NotEmpty().WithMessage("Zip address cannot be empty.")
                .Matches(@"^\d{5}(-\d{4})?$").WithMessage("Zip address must be a valid US zip code.");
        }
    }
}
