FROM ubuntu:latest
MAINTAINER info@sinq.ca
 
# Add crontab file in the cron directory
ADD crontab /etc/cron.d/docker-cron
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/docker-cron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log

#Init crontab script
RUN /usr/bin/crontab /etc/cron.d/docker-cron
 
# Run the command on container startup
CMD [“cron”, “-f”]
