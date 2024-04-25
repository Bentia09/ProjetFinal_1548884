using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileSystemGlobbing.Internal.Patterns;
using Symphonie.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();


// Add DbContext
builder.Services.AddDbContext<BD_OrchestreContext>(
    options => {
        options.UseSqlServer(builder.Configuration.GetConnectionString("BD_Orchestre"));
       //options.UseLazyLoadingProxies();
    });


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();
app.UseEndpoints(endpoints => {
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Etudiants}/{action=Index}/{id?}"
        );
});
app.MapRazorPages();

app.Run();
