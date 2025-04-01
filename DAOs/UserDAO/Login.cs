using EatLogProject.Security;
using EatLogProject.DTOs.UserDTO;
using EatLogProject.Utils;
using Microsoft.Data.SqlClient;

namespace EatLogProject.DAOs.UserDAO
{
    public class Login
    {
        public async Task<UserDTO?> LoginAsync(UserDTO request)
        {
            using var conn = new SqlConnection(DBUtils.ConnectionString);
            await conn.OpenAsync();
            string query = "SELECT password FROM tbl_Users WHERE username = @username";
            using var cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", request.UserName);
            var data = await cmd.ExecuteReaderAsync();
            if (!data.HasRows) return null;
            await data.ReadAsync();
            string hashsedPassword = data.GetString(0);
            bool isValid = SecureVault.Verify(request.Password, hashsedPassword);

            return isValid ? request : null;
        }
    }
}
