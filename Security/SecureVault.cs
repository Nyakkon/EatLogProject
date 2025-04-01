using BCrypt.Net;

namespace EatLogProject.Security
{
    public static class SecureVault
    {
        public static string Hash(string plainText)
        {
            return BCrypt.Net.BCrypt.HashPassword(plainText);
        }

        public static bool Verify(string plainText, string hashed)
        {
            return BCrypt.Net.BCrypt.Verify(plainText, hashed);
        }
    }
}
