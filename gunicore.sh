[Unit]
Description=Gunicorn instance to serve web_dynamic/2-hbnb.py
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/AirBnB_clone_v4
Environment="HBNB_MYSQL_USER=hbnb_dev"
Environment="HBNB_MYSQL_PWD=hbnb_dev_pwd"
Environment="HBNB_MYSQL_HOST=localhost"
Environment="HBNB_MYSQL_DB=hbnb_dev_db"
Environment="HBNB_TYPE_STORAGE=db"
Environment="HBNB_API_HOST=0.0.0.0"
Environment="HBNB_API_PORT=5000"
ExecStart=/home/ubuntu/.local/bin/gunicorn --workers 3 --bind 0.0.0.0:5003 web_dynamic.2-hbnb:app --access-logfile /tmp/airbnb-access.log --error-logfile /tmp/airbnb-error.log

[Install]
WantedBy=multi-user.target
