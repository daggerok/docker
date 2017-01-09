FROM jenkins
# if we want to install via apt
USER root
# attention: hardcoded user and password (lines 7, 8, 9 and 12)
RUN apt update \
  && apt install -y htop sudo openssh-server vim \
  && useradd -m mak && echo "mak:mak" | chpasswd \
  && adduser mak sudo \
  && echo "\nmak ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && service ssh restart

# attention: hardcoded user (lines: 10 and 11) and rsa public key (line 13)
USER mak
# RUN echo -e "\n\n\n" | ssh-keygen -t rsa -b 4096
RUN ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa \
  && export PUBLIC_KEY="ssh-rsa AAA..." \
  && echo $PUBLIC_KEY >> ~/.ssh/authorized_keys \
# RUN export USER=mak \
#   && mkdir -p /home/$USER/.ssh \
#   && export PUBLIC_KEY="ssh-rsa AA..." \
#   && echo $PUBLIC_KEY >> /home/$USER/.ssh/authorized_keys \
#   && chown -R $USER:$USER /home/$USER \
#   && chmod g-w /home/$USER \
#   && chmod 750 /home/$USER \
#   && chmod 700 /home/$USER/.ssh \
#   && chmod 600 /home/$USER/.ssh/authorized_keys
# drop back to the regular jenkins user - good practice
USER jenkins
EXPOSE 22 8080 5000
