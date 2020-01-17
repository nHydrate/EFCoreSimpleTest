using System;
using Microsoft.EntityFrameworkCore;

namespace Acme.TestProject.EFDAL
{
	partial class TestProjectEntities
	{
		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			//READ ME!!!!
			//STEP 1: Add database provider
			//Depending on your database provider add one of the following libraries in Nuget
			//SQLServer: Microsoft.EntityFrameworkCore.SqlServer
			//Postgres: Npgsql.EntityFrameworkCore.PostgreSQL
			//Sqlite: Microsoft.EntityFrameworkCore.Sqlite

			if (string.IsNullOrEmpty(_connectionString?.Trim()))
				throw new Exception("Missing connection string");

			if (this.ContextStartup.AllowLazyLoading)
				optionsBuilder = optionsBuilder.UseLazyLoadingProxies();

			//STEP 2: Uncomment one of these based on database provider
			//Add the appropriate line based on your database provider and delete the exception line below
			optionsBuilder.UseSqlServer(_connectionString); //Sql Server
			//optionsBuilder.UseNpgsql(_connectionString); //Postgres
			//optionsBuilder.UseSqlite(_connectionString); //Sqlite
		}

	}
}
