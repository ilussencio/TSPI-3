	docker pull mysql
	docker run -e MYSQL_ROOT_PASSWORD=root --name DB_MYSQL -d -p 3306:3306 mysql:5.7 --lower_case_table_names=1