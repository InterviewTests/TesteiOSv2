Read this before you open the Swift file

To build the swift file app, you will need to install Alamofire and CocoaPods that will help the app to communicate with the API.
To install both CocoaPods and Alamofire, follow the instructs bellow:

_________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________

Instaling CocoaPods

Using the terminal, get into your project folder.

Type the command: sudo gem install cocoapods

It will request you to enter your admin password to complete the installation

After the installation, type the command: pod init

To make sure the command worked, type "ls" and check if the "Podfile" folder was created into your Project's folder.

____________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________

Installing AlamoFire

Open the Podfile using the command: open Podfile

Ater opening the file, you must past the lines bellow into the file's body.
	target 'Desafio_Santander' do
	use_frameworks!
	pod 'Alamofire', '~> 5.0.0-beta.5'
	end

You can now save and close your Podfile

Type the command: pod install 

All the alterations made in your Podfile will be installed in this step. You will receive in the prompt, a message informing you that the installation is complete

________________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________

Note:
	From now on, to have access your implementation of Alamofire, you must open the project file that has ".xcworkspace" extension.
