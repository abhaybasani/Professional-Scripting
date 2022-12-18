#check version of powershell

>$psversiontable

#how to print something in power shell
>write "hello world"



#-----Execution policy -------
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
