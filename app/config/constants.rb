require './app/services/mongo_db.rb'
require './app/services/my_sql.rb'
require './app/services/postgre_sql.rb'
require './app/services/sql_server.rb'

class Constants

	DATABASES = {
		mongodb: MongoDb.new,
		mysql: MySql.new,
		postgresql: PostgreSql.new,
		sqlserver: SqlServer.new
	}

	POSSIBLE_DBS = ['mysql', 'mongodb', 'postgresql', 'sqlserver']
end
