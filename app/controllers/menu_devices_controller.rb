class MenuDevicesController < ApplicationController
  require 'apn_on_rails'
  
  def new #Register the device for notifications with rails call the action from a ASIFormDataRequest on iOS
    #THESE CONFIGURATIONS ARE DEFAULT, IF YOU WANT TO CHANGE UNCOMMENT LINES YOU WANT TO CHANGE 
    configatron.apn.passphrase  = '' 
    configatron.apn.port = 2195 
    configatron.apn.host  = 'gateway.sandbox.push.apple.com' 
    configatron.apn.cert = File.join(Rails.root, 'config', 'apple_push_notification_development.pem')  
    #THE CONFIGURATIONS BELOW ARE FOR PRODUCTION PUSH SERVICES, IF YOU WANT TO CHANGE UNCOMMENT LINES YOU WANT TO CHANGE 
    #configatron.apn.host = 'gateway.push.apple.com' 
    #configatron.apn.cert = File.join(RAILS_ROOT, 'certs', 'apns-dev.pem')  
    #device = APN::Device.create(:token => "77bb6383 855eab6e 2aa0a189 a06c92cf e29bb097 590430c0 a3c2cace cac068a9") #my ipad 2
    if !params[:token].nil?
      device = APN::Device.create(:token => params[:token])
      notification = APN::Notification.new 
      notification.device = device
      notification.badge = 1
      notification.sound = 'navilisten.aif'
      notification.alert = "Your Device is sucessfully registered" 
      notification.save
      APN::Notification.send_notifications
      #rake apn:notifications:deliver
    end
  end
  
  def create
    
    configatron.apn.passphrase  = '' 
    configatron.apn.port = 2195 
    configatron.apn.host  = 'gateway.sandbox.push.apple.com' 
    configatron.apn.cert = File.join(Rails.root, 'config', 'apple_push_notification_development.pem')
    
    @notification = APN::Notification.new 
    @notification.device_id = params[:d]
    @notification.badge = params[:b]
    @notification.sound = params[:s]
    @notification.alert = params[:msg]
    @notification.save
    APN::Notification.send_notifications
    flash[:success] = "Message Sent!"
    @devices = APN::Device.all
    render 'show'
  end

  def edit
  end

  def destroy
  end

  def show
    @devices = APN::Device.all
  end

end
