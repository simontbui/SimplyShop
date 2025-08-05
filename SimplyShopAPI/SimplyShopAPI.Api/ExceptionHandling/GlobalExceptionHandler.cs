using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace SimplyShopAPI.Api.ExceptionHandling
{
    internal sealed class GlobalExceptionHandler : IExceptionHandler
    {
        private readonly IProblemDetailsService _problemDetailsService;
        private readonly ILogger<GlobalExceptionHandler> _logger;

        public GlobalExceptionHandler(IProblemDetailsService problemDetailsService, ILogger<GlobalExceptionHandler> logger)
        {
            _problemDetailsService = problemDetailsService;
            _logger = logger;
        }

        public async ValueTask<bool> TryHandleAsync(HttpContext httpContext, Exception exception, CancellationToken cancellationToken)
        {
            _logger.LogError(exception, "Unhandled exception occurred");

            httpContext.Response.StatusCode = exception switch
            {
                ApplicationException => StatusCodes.Status400BadRequest,
                ArgumentException => StatusCodes.Status400BadRequest,
                UnauthorizedAccessException => StatusCodes.Status401Unauthorized,
                NotImplementedException => StatusCodes.Status501NotImplemented,
                _ => StatusCodes.Status500InternalServerError
            };

            return await _problemDetailsService.TryWriteAsync(new ProblemDetailsContext
            {
                HttpContext = httpContext,
                Exception = exception,
                ProblemDetails = new ProblemDetails
                {
                    Type = exception.GetType().Name,
                    Detail = exception.Message,
                    Title = "An error occured"
                }
            });
        }
    }
}