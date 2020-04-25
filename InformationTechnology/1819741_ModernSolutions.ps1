function KillThatProcess ($processName)
{
    $numError = "I don't want your numbers. Give me a process name."

    if ($processName)
    {
        if ($processName -as [decimal])
        {
            Write-Host $numError -ForegroundColor Red
        }
        else
        {
            if (Get-Process $processName)
            {
                foreach ($process in Get-Process ($processName)) 
                { 
                    $count++ 
                } 

                Write-Host There are $count processes running. -ForegroundColor Cyan
                $userinput = Read-Host Would you like to proceed with killing all the processes? "(Y/N)"
    
                if ($userinput.ToLower() -eq 'y')
                {
                    Write-Host You might wanna look away. -ForegroundColor Cyan
                    Write-Host "*Grabs knife*" -ForegroundColor Red
                    Get-Process -Name $processName | spps
                    Write-Host That should do it. -ForegroundColor Cyan
                }
                else
                {
                    if ($userinput.ToLower() -eq 'n')
                    {
                        Write-Host "No? Then why did you run this command, silly? I guess I'll just abort the operation then." -ForegroundColor Cyan
                    }
                    else
                    {
                        Write-Host "Well, you didn't input the letter Y, so I'm gonna abort the operation just to play it safe." -ForegroundColor Cyan
                    }

                    Write-Host "If you are against abortion, then all you had to do was kill the damn processes." -ForegroundColor Red
                }
            }
            else
            {
                Write-Host The process does not exist at the moment. Did you make a typo or is the process just not running? -ForegroundColor Red
            }
            
        }
    }
    else
    {
        Write-Host "It's a bit hard to kill a process without its name. Try again." -ForegroundColor Red
    }
}

function Bamboozle ($path = $pwd)
{
    $arr = (65..90)
    $code = Get-Random $arr
    $char = [char]$code
    Write-Host "Listen up, stinky hackers. You don't deserve any of my pity after the notepad incident, but I'm still gonna give you a chance." -ForegroundColor Cyan
    Write-Host "If you can guess which letter I'm thinking of, I won't delete the files that contain that letter in its name." -ForegroundColor Cyan
    $input = Read-Host "So, which letter will you choose?"
    
    if ($input.ToUpper() -eq $char)
    {
        Write-Host "Holy fuck - you actually guessed $char correctly, you son of a bitch. I guess I won't mess with you today." -ForegroundColor Green
    }
    else
    {
        Write-Host "Haha, the random letter was $char! Prepare for your doom!" -ForegroundColor Red
        $arr2 = Get-ChildItem | where {!$_.PsIsContainer}

        if ($arr2.Length -eq 0)
        {
            Write-Host "Shit, there are no files in that folder. You win this time, hackers..."
        }
        else
        {
            foreach ($item in $arr2)
            {
                if ($item -like "*$char*")
                {
                    Write-Host "$item contains the letter $char, thus it shall be deleted." -ForegroundColor Yellow
                    $item | Remove-Item -WhatIf
                    $counter++
                }
            }
            if (!$counter)
            {
                Write-Host "Oops - none of the files seem to contain that letter. You got lucky today, boy." -ForegroundColor Cyan
            }
            else
            {
                Write-Host "Yeah, that's right. I spared you with a WhatIf. Maybe next time I won't be so kind to you hackers." -ForegroundColor Cyan
            }
        }

    }
}