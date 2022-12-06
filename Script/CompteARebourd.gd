extends Control

export (int) var minutes = 0
export (int) var secondes = 0
var dsec = 0


func _physics_process(delta):
	
	
	if secondes > 0 and dsec <= 0 :
		secondes -= 1
		dsec = 10
		
	if minutes > 0 and secondes <= 0:
		minutes -= 1
		secondes = 59
	
		
	if minutes >= 10:
		$min.set_text(str(minutes))
	else:
		$min.set_text("0"+str(minutes))
	if secondes >= 10:
		$sec.set_text(str(secondes))
	else:
		$sec.set_text("0"+str(secondes))
	if dsec >= 10:
		$dsec.set_text(str(dsec))
	else:
		$dsec.set_text("0"+str(dsec))
	
		


func _on_Timer_timeout():
	dsec -= 1
