local cameraMove = 35
local bfX = 870
local bfY = 360
local dadX = 460
local dadY = 340
local ultraAgressiveTails = false
local agressiveTails = false

function onStepHit()
    if curStep == 295 or curStep == 610 or curStep == 724 or curStep == 841 or curStep == 888 or curStep == 1042 or curStep == 1221 or curStep == 1256 or curStep == 1369 or curStep == 1456 or curStep == 1544 or curStep == 1682 or curStep == 1794 or curStep == 2101 or curStep == 2146 or curStep == 2247 or curStep == 2298 or curStep == 2246 or curStep == 2496 or curStep == 2583 or curStep == 2597 then
        agressiveTails = true
        ultraAgressiveTails = false
    end

    if curStep == 455 or curStep == 520 or curStep == 634 or curStep == 868 or curStep == 1249 or curStep == 1262 or curStep == 1416 or curStep == 1469 or curStep == 1632 or curStep == 1694 or curStep == 1845 or curStep == 2140 or curStep == 2258 or curStep == 2333 or curStep == 2484 or curStep == 2534 or curStep == 2591 then
        agressiveTails = false
        ultraAgressiveTails = true
    end

    if curStep == 466 or curStep == 585 or curStep == 619 or curStep == 672 or curStep == 807 or curStep == 919 or curStep == 1193 or curStep == 1275 or curStep == 1442 or curStep == 1494 or curStep == 1745 or curStep == 2196 or curStep == 2346 or curStep == 2546 or curStep == 2647 then
        agressiveTails = false
        ultraAgressiveTails = false
    end
end

function opponentNoteHit()
    health = getProperty('health')

    if health > 0.05 and agressiveTails == true and ultraAgressiveTails == false then
        setProperty('health', health - 0.02);
    end

    if health > 0.15 and agressiveTails == false and ultraAgressiveTails == true then
        setProperty('health', health - 0.07);
    end
end

function onUpdate(elapsed)
	if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', dadX - cameraMove, dadY)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', dadX + cameraMove, dadY)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', dadX, dadY - cameraMove)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', dadX, dadY + cameraMove)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', dadX, dadY)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', bfX - cameraMove, bfY)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', bfX + cameraMove, bfY)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', bfX, bfY - cameraMove)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', bfX, bfY + cameraMove)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', bfX, bfY)
            end
    end	
end

