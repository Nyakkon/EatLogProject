using System.ComponentModel.DataAnnotations;

namespace EatLogProject.DTOs.UserDTO
{
    public class UserDTO
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
