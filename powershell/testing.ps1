#Power Shell writen in .NET language
#Made by Microsoft to automate the system administration Tasks on the windows and Windows Server.

#for check powerShell version
>PSVersionTable

#for known information about command
>Get-command ping
>Get-Command cd
 
#-----------------  PowerShell version -------------------
#To launch the PowerShell console, Run the command Powershell.exe. Press ctrl+R to open the RUN as dilog. Enter powerShell, Then press Enter, Press WIN and type PowerShell. windows search for your keywords.
#curently we used powershell v5.1


#The Windows PowerShell ISE
#PowerShell CMDLET Structure
#1->Verb= verb is the action (Get, Set, New etc)
#2->Noun= its is the resource (service,Process)
#3->Prefix= used to group (AD, SP, Azure AD)

#Use of Tab in PS & help
#It discover the command and its parameter
#and get-help command is used to get help related Commands
#we can find command Script using get-help command in powerShell.

>Get-Help About*

#--------------   What is module -------------
#A module is a package that contains PowerShell commands, Such as cmdlets, Provides functions, workflows, Variable and alias.
#People who receive module can add the commands in the modules to their PowerShell session and use them just like the build in command.

#Aliases = A shortcut to a command that can save your time.
#pipeline 
>get-service spooler | restart-service

#----------  Feature of PowerShell  -------------
#1-PowerShell Remoting
#2-Background jobs
#3-transactions
#4-Network file Transfer

#Get --> to get something
#Start -->to run something
#Out -->to out something
#Stop -->to stop something that is running
#set -->to define something
#New -->to create something

>get-command

#----------------  Command to get module  -------------

>Get-Command -Module Microsoft.Powershell.LocalAccount
>Get-Command -Module Microsoft.Powershell.LocalAccount | Mesure-object


#------------   Group Management Using PowerShell  ---------------
#New-ADGroup  --> Create a new ADGroup
#Add-ADgroupMember -->Adding User to an ADGroup
#Remove-ADGroupMember -->Remove User from an ADGroup
#Get-ADGroup -->Getting Information About an ADGroup
#Get-ADGroupMember -->Displaying the list of users in an ADGroup

>import-module ActiveDirectory

#You can get a cpmplete list of module commands by running the folling
>Get-command -Module ActiveDirectory
>mkdir test
>cls
>md test

#For check Process Task
>ps
>history
>ipconfig

#hide a file/folder using PowerShell
>attrb +h test
#unhide a folder
>attrb -h test

#check running task
>tasklist
>taskkill /pid 1234

#Create a Domain in windows Server [try on VMWARE]
#on windows server open powershell

#rename of the computer
>Rename-Computer -NewName "testing"
#Note:-- when you restart PC it will change PC name.
>Shutdown -r -t 0

#IP Adress details
>ipconfig
>Get-NetIPAddress    #for all n/w adapter details

#how many adapter are in system
>Get-NetAdapter

#get eth0 adapter details
>get-NetAdapter ethernet0

#Change ip address using PowerShell
>New-NetIPAddress -InterfaceIndex 12 -IPAddress 10.0.0.40 -PrefixLength 8 -DefaultGateway 10.0.0.10

#set DNS IP manual
>set-DnsClientServerAddress -InterfaceIndex 12 -serverAddress 8.8.8.8
>ipconfig
>ipconfig /release
>ipconfig /renew
# Note:- after shutdown it will change DNS name

#Change ethernet [LAN] port name.
>Rename-NetAdapter -name ethernet0 -NewName eth0

#Disable Network Adapter
>Disable-NetAdapter -ifAlias eth0
#for Check goto --> ncpa.cpl

##-------------   Windows PowerShell Scripts for ADDS Development    --------

#Windows PowerShell script for AD DS development
Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "itsupport.com" `
-DomainNetbiosName "ITSUPPORT" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\SYSVOL" `
-Force:$true

#NOTE:-- Copy the Whole command and paste it on PowerShell, And give Admin password 2 times

#Get local Group details
>Get-LocalGroup

#Get local User Details
>Get-LocalUser

#[True=userActive]
#[False=offline]

#Import AD so you can do all you need in AD
>Import-Module ActiveDirectory

#Create a new user in Active Directory
>New-ADUser -Name user1 -UserPrincipalName User1@itsupport.com

#Set user password for Active Directory
#Enable [Active] a user from ActiveDirectory
>Enable-ADAccount -Identity user1
>Get-LocalUser

#Create a Complite user from ActiveDirectory
>Enable-ADAccount -Identity user1
>Get-LocalUser

#Create a Camplite user and Active it , ou=hr (hr is a group), dc=(id of user)
>New-ADUser -Name "local user2" -GivenName local -Surname user2 -UserPrincipalName user2@itsupport.com -DisplayName "local user2" -Path "ou=hr, dc=itsupport, dc=com" -AccountPassword (Read-host -AsSecureString "SetUserPassword") -PassThru | Enable-ADAccount

# create a new group for Adapter
>New-ADGroup test
#Note:We have 3 type of Group 
#Group Scope::-- #1-Domain LocalAccount
				 #2-Global
				 #3-Universal
#Group Type::--  
				#1-Security
				#2-Distribution

#for check group Identity of group and Details about group
>Get-ADGroup -Identity gp

#Add discription in group
>New-ADGroup -Name test -Description "this is test" -GroupScope global

#create a complete group
>New-ADGroup -Name test4 -Discription "this is test4" -GroupScope Global -path "ou=hr, dc=itsupport, dc=com"

#add user on Group
>Add-ADGroupMember

#Remove a user from a group
>Remove-ADGroupMember -Identity account -Members "test4"

#Organizational Unit (ou); Create a OU in PowerShell.
>New-ADOrganizationalUnit account
>New-ADOrganizationalUnit technical

#Get details about OU
>Get-ADOrganizationalUnit -Identity "ou=technical, dc=itsupport, dc=com"

#Remove a Organizational Unit in PowerShell
>Remove -ADOrganizationalUnit -Identity "ou=account, dc=itsupport, dc=com" -ProtectedFromAccidentalDeletion:$false

>Remove -ADOrganizationalUnit -Identity "ou=account, dc=itsupport, dc=com"

#get Log Details

>Get-EventLog -LogName 'DNS Server' -Newest 3

#Get info about your system
>wmic
wmic:root\cli>cpu

#graphical system information
>msinfo32

#Diskmanage Command
>diskpart
>list disk
>select disk 0
> ?

#Scan Drive on fix bug 
>chkdsk

#system info
>systeminfo

#check version of powershell

>$psversiontable

#how to print something in power shell
>write "hello world"



#-----Execution policy -------gi
#Note:- we have 4 ways of executation. 
		#1-Restricted(default,because you can run malisious program)  
		#2-Unrestricted
		#3-RemoteSigned
		#4-AllSigned
		#5-Bypass
		
#check your all powershell policy
>Get-ExecutionPolicy
#show execution policy list
>Get-ExecutionPolicy -List
#change your powershell policy
>powershell.exe -ExecutionPolicy Bypass -File '.\testing.ps1'
#change execution policy all the scripts/files [run as admin]
>Set-ExecutionPolicy unrestricted

#---------  Get-help and Get-Command ------

#show all the command in powershell
>Get-Command
#Show speafic command in PS
>Get-Command -Name Add*
>Get-Command -Name Get*
#Or Show speafic command /i= ignore string
>get-command | findstr /i get*

#get last last file acess details
>(get-item d:\).lastacesstime

#get-help of any command
>get-help
#show all running services
>get-help get-service
#check how commands works with example
>get-help get-service -examples

#show get-help in new gui pop bar
>get-help get-service -ShowWindow


#------------  
#--------- Get-Alias and New-Alias ------------

>dir
>cd
>ls

#find dir alias
>get-command | findstr dir

#in PS 5* you can find all command usig >Get-Alias also you can see short form of every command
>Get-Alias
#write output a Hello world
>write-output "hello world!"
#ls/dir alternative Get-ChildItem
>Get-ChildItem
#create your own alias
>get-help new-alias
#name=name of command, value=command you want to put in
>New-Alias -name "abhay" -value "get-date"
#check your created alias
>get-alias



#-----------  Formating Using PowerShell ----------------

#get hostname using powershell
>get-host
#get proper hostname
>Get-Host | Format-Table

#know all running process in system
>Get-Process
#get proper running process
>get-process | Format-List
#view particular column on process
>get-process | Format-Table -property ProcessName
>get-process | Format-Table -property hadle,ProcessName
#or you can do this
>get-process | select Handle,ProcessName
#see all the details
>get-process | Format-Table -wrap



#---------------- [ CMDLETS ] Object oriented in PowerShell  --------

#Run on powershell ISE
#for show date on output
(get-date).date
#get day 
(get-date).day
#get miliseconds
(get-date).Ticks
#add a number on day if day was 12 you add 2 on it it would 14
(get-date).addDays(2)
#get CPU process on system
(get-process).CPU
 
 #kill a processs using powershell
 1-> open Notepad
 #on powershell
 >Get-Process | Findstr /i notepad
 >$a=Get-Process notepad
 #now you can see all the attrabute
 >$a.Id
 >$a.Path
 >$a.kill
 
 
 #------------   Variables and DataTypes in PowerShell ---------
 
write "hello duniya"
$var="hello bahi 55"
$var1s =2/8

[int] $var2=22*5
write-output "$var"
#get the type of var2
$a.GetType()

[string] $a="abhay"
$a.GetType()
$a.Length

#for known system define Variables
Get-Variable

#----------    User Input in power shell --------

write "here user input code start"
# we use read-host for take input from user

$inp= Read-Host "Enter some Value: "
$inp
$inp.GetType()

[string] $a="8"
# -AsSecureString= for hide user input on password. Note:- you can not print password in AsSecureString.
[int] $b= Read-Host "enter password" -AsSecureString
$b   #this din't print password

#if you want to print pwd you have to convert secure string to demarshal format
$pwd= Read-Host "enter password" -AsSecureString
$pwd=[System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
$pwd
 
 #treaking input
 $c, $d, $e, $f=1,2,3,4
 $c
 $d
 $e
 $f
 
 
 #----------  Command line Argument ------
 
 #on test.ps1
 $a= $args[0]
 $a
 
 #on powershell
 >& '.\test.ps1' 55
 
#2 agrs input
$a=$args[0]
$b=$args[1]

$a.GetType()
$b
$b.length
>& '.\test.ps1' 55 'hoyah'

#------ parameters --------
param($firstname,$lastname)
write $firstname 

>& '.\test.ps1' -firstname 'abhay' -lastname 'basani'

#-----------  Operators ------------
$a=10
$b=30
$a+20
#or
$a+=20
$a
$a-=5
$a*=3
$a/2
$a%2
#----  relational operators ------
$a=200
$b=20
$a -gt $b
$a -ge $b
$a -eq $b
$a -ne $b

($a -eq $b) -AND ($a -gt $b)
$a
$b
($a -eq $b) -OR ($a -gt $b)
$a
$b
NOT ($a -eq $b) -OR ($a -gt $b)
$a
$b


#-------------  Enviroment Variable  ---------------

#For check Enviroment Variable goto:
					#1- this PC 
					#2-Properties
					#3-Advanced System Setting
					#4-Click on Enviroment Variable
					
>ping google.com
 
#list the Enviroment Variable using PowerShell
>dir env:

#For check enviroment Path
>$env:Path
#For check username in env
>$env:USERNAME
#for get hostname in env
>$env:COMPUTERNAME

##--------------   Loops in PowerShell  -----------------
#on powerShell ISE

#For loops in powershell
For($i=0;$i -le 20;$i++){
	write $i
};

#While Loops
i=30
While($i -lt 30){
	write $i
	$i++
};

#if else condition in python
$a=22
if($a -lt 30){
	write "a is less than 10"
}
elseif($a -eq 20){
	write "a is equal to 20"
}
esle{
	write "a is greater than 20"
};

foreach($i in get-process){
	write $i.name
	write $i.path
	write $i.id
};

#----------- Arrays --------------
$a=@(50,60,70)

#indexing in powershell
$a[1]
$a[2]

#functions in powershell array
$a.Count

#if you want add items on the list 
$a.Add(80)
$a.Add(55)
$a

#Change array type to array list
[System.Collection.ArrayList]$b=@(50,38,22,60)
$b.Add(80)
$b

#insert a value in array in PowerShell
$b.insert(1,88)
$b

#Remove a item from the list
$b.remove(38)
$b

#--------    -----------
[System.Collection.ArrayList]$c=@(54,55,60)

$b[0]=100
for($i=0;$i -lt $b.count;$i++)
{
	write $b[$i]
}

foreach($i in $b){
	write $id
}

#find the index of a array
$b.IndexOf(55)
