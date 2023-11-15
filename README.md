# Finding AI Registry Test
This is a project for RAIK270H, that aids in collecting data. 
# Debug Instructions
## Verifying data is recorded
All response data is stored in "Response.db". You can use the ruby console to verify whether or not data is collected. 
`rails console`
`Response.all`
This will show you all responses recorded, ever. If you want just responses for a given user, you'll have to do the following:
`Response.find(USERID)`
User IDs are cookies that are logged per browser session. 