sudo docker run -d --restart unless-stopped --log-opt max-size=10m \
  -p 8020:80 \
  -e TZ=America/New_York \
  -e 'CRON_MIN=1,31' \
  -v freshrss_data:/var/www/FreshRSS/data \
  -v freshrss_extensions:/var/www/FreshRSS/extensions \
  --name freshrss \
  freshrss/freshrss