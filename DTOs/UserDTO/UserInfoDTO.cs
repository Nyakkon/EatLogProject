using System.ComponentModel.DataAnnotations;

namespace EatLogProject.DTOs.UserDTO
{
    public class UserInfoDTO
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public DateOnly DateOfBirth { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string PhoneNumber { get; set; }

        [Required]
        public string Address { get; set; }
        public string Bio { get; set; } = string.Empty;
    }
}
