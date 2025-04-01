using EatLogProject.DTOs;
using EatLogProject.DAOs.UserDAO;
using Microsoft.AspNetCore.Mvc;
using EatLogProject.DTOs.UserDTO;

namespace EatLogProject.Controllers
{
    [ApiController]
    [Route("api/user")]
    public class UserController : ControllerBase
    {
        private readonly Login _loginDAO = new();

        [HttpPost("login")]
        public async Task<ActionResult> Login([FromBody] UserDTO request)
        {
            var result = await _loginDAO.LoginAsync(request);
            if (result == null) return Unauthorized(new { message = "Invalid username or password" });

            return Ok(new { message = "Login successful", user = result });

        }
    }
}
