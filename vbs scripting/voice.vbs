Dim msg, sapi

msg=InputBox("ENter what you want to listen: ")
Set sapi=CreateObject("sapi.spvoice")
sapi.Speak msg