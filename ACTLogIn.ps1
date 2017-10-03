$request = Invoke-WebRequest -Uri http://portal.actcorp.in/web/blr/home

If ($request.StatusCode -eq 200)
{
    If($request.Forms[1].Action.Contains("login"))
    {
        $body = @{userIP=$request.InputFields.FindByName("userIP").Value;_login_WAR_BeamPromotionalNDownloadsportlet_uname="102016383253";pword="Sunday@123"}
        $response = Invoke-WebRequest $request.Forms[1].Action -Method Post -Body $body

        If($response.StatusCode -eq 200 -and $response.StatusDescription -eq "Ok")
        {
            Write-Host "Hurray!!!! We are logged in"
        }
        else
        {
            Write-Host "Some Error !! Did Not Log in, Status Code:  " + $response.StatusCode
        }
    }
    ElseIf ($request.Forms[1].Action.Contains("logout"))
    {
        $body = @{loggedInUser="102016383253"}
        $response = Invoke-WebRequest $request.Forms[1].Action -Method Post -Body $body
        If($response.StatusCode -eq 200 -and $response.StatusDescription -eq "Ok"){
            Write-Host "We are logged out"
        }
        else{
             Write-Host "Some Error !! Did Not Log in, Status Code:  " + $response.StatusCode
        }
    }
}
Else {
    Write-Host "---------Act Not Reachable; Make sure you are in the network-----------"
}




