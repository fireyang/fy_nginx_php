build:
	sudo docker build -t=fy_nginx_php:1.0 -f=Dockerfile .
run:
	sudo docker run -i --name nginx_php_con -t -p 5011:80 -v `pwd`:/data fy_nginx_php:1.0
run_deamon:
	sudo docker run -d -i --name nginx_php_con -p 5011:80 -v `pwd`:/data fy_nginx_php:1.0

clear:
	sudo docker rm -f nginx_php_con

