var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => Results.Json(new { service = "dotnet-webapi", status = "running" }));
app.MapGet("/health", () => Results.Json(new { status = "healthy" }));

app.Run("http://0.0.0.0:5000");
