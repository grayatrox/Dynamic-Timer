#persistent
#SingleInstance force
#include timer.ahk
timers := map("timer",timer.new("test",1000),"timer2",timer.new("test2"),"timer3",timer.new("test3",2000))
try{
     timers["timer4"] := timer.new("invalidFunction")
     timers["timer4"].Start()
} catch e {
    error(e)
}

tooltip "The name of timer is: " timers["timer"]._name
Sleep 1000
tooltip
 
timers["timer"].Start()
timers["timer3"].Start()
timers["timer2"].interval := 90000000
timers["timer"]._name := "test4"

return
error(e){
    msgbox(e,"Exception", 16)
}
test4(){
    global timers
    timers["timer4"].Stop()
}

test(){
    global timers
        if (timers["timer"].count == 1){
            timers["timer3"].Stop()
            try{
                timers["timer2"].interval := "A"
            } catch e {
                error(e)
                timers["timer2"].interval := 10000
            }   
            timers["timer2"].Start()
        }
        tooltip "Time until test is over: " round(timers["timer2"].interval/1000-timers["timer"].count+1) "s"
    return
}

test2(){
    global timers
    timers["timer"].Stop()
    tooltip ""
    msgbox "Test Finished. Exiting."
    ExitApp
}
test3(){
    Msgbox "You shouldn't see this msgbox"
}
