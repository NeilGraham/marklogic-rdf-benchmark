FROM bash:5.1.0

# Install required packages
RUN apt-get update && \
    apt-get -y install openssl uuid-runtime

# Copy script into container
COPY generate_strings.sh /generate_strings.sh
RUN chmod +x /generate_strings.sh

# Set default command
CMD ["/generate_strings.sh"]
