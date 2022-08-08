<?php
if (isset($_POST['l'])){

// 			echo("<script> var r=confirm('etes-vous sur de vous deconnecter .');
			 
// if (r == true)</script> ");
 header('location:http://localhost/park%20shine%20soo%20-%20Copie/home.php'); exit();			
}
					?>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		<!--styles -->
		<link rel="stylesheet" href="css/jquery.fancybox.css">
		<link rel="stylesheet" href="css/font-awesome.css">
		<link rel="stylesheet" href="css/jquery.owl.carousel.css">
		<link rel="stylesheet" href="css/main.css">
		<script>
			// Ignore this in your implementation
			window.isMbscDemo = true;
		</script>
	
		<title>View/update event </title>
	
		<!-- Mobiscroll JS and CSS Includes -->
		<link rel="stylesheet" href="css1/mobiscroll.javascript.min.css">
		<script src="js1/mobiscroll.javascript.min.js"></script>
	
		<style type="text/css">
		body {
			margin: 0;
			padding: 0;
		}
	
		.md-view-update-demo {
			position: absolute;
			height: 100%;
		}
		
		.md-view-update-demo .mbsc-row {
			height: 100%;
		}
		
		.md-view-update-demo .md-col-right {
			overflow: auto;
			height: 100%;
			border-left: 1px solid #ccc;
		}
		
		.md-view-update-popup {
			max-width: 400px;
		}
		
		.md-hidden .mbsc-color-input {
			display: none;
		}
		
		.md-view-update-demo .md-edit-btn {
			margin: 0;
			position: absolute;
			right: 10px;
			top: 8px;
			z-index: 1;
			transition: background-color .3s ease-out;
		}
		
		.mbsc-material .md-view-update-demo .md-edit-btn {
			top: 6px;
		}
		
		.mbsc-windows .md-view-update-demo .md-edit-btn {
			top: 10px;
		}
		
		.md-view-update-demo .md-edit-btn.mbsc-btn-outline.mbsc-btn:not(:disabled):not(.mbsc-active):hover:hover {
			background: #3f97f6;
			color: #fff;
		}
		
		.mbsc-rtl .md-view-update-demo .md-edit-btn {
			right: auto;
			left: 10px;
		}
		</style>
	
	</head>
	<body>
		<header id="home">
			<div class="stick-wrapper">
				<div class="sticky clear">
					<div class="grid-row">
						<img class="splash" src="img/splash.png" alt="">
						<div class="logo">
							<a href="index.html"><img src="images/logo.png"  width="130"alt=""></a>
						</div>
						<nav class="nav">
							<a href="#" class="switcher">
								<i class="fa fa-bars"></i>
							</a>
							<ul class="clear">
						<!-- <li><a href="http://localhost/assistante/index.php">Rendez vous</a></li>
						<li><a href="http://localhost/assistante/memoAss.php">Memo</a></li> -->

							<li><a href="index.php">Rendez-vous</a></li>
							<li class="left">
							<a href='doctorMemo.php'>Memo</a>
							<ul>
								<li><a href="doctorMemo.php"><span>Assistante</span></a></li>
								<li><a href="doctorMemo1.php"><span>Patient</span></a></li>
	
							</ul>
						</li>
                            <li><a href="doctorSta.php">Statistique</a></li>
							<li><a href="dossierMedical.php">Patients</a></li>
							<li><a href="doctorMsg.php">Messages</a></li>
						<li class="last"><form action="#" method="POST" >
							<!-- <button  type="submit" name='logout'></button> -->
							<button  type="submit" name='l' >
								
								<a> Deconnexion</a>
					</button>
						
							
						</form>
						</li>
					</ul>
						</nav>
					</div>
				</div>
			</div>
		</header>

		<div mbsc-page class="demo-view-update-event">
			<div mbsc-form>
				<div class="mbsc-grid md-view-update-demo">
					<div class="mbsc-row mbsc-no-padding">
						<div class="mbsc-col-md-4 mbsc-col-12"> 
							<div id="demo-view-update-event"></div>
						</div>
						
						<div class="mbsc-col-md-8 mbsc-col-12 md-col-right">
							<div id="demo-view-update-event-list"></div>
						
						</div>
					</div>
				</div>
			</div>
			
			<div id="demo-view-update-popup" class="md-view-update-popup">
				<div mbsc-form>
					<div class="mbsc-form-group">
						<label>
							le Patient
							<input mbsc-input id="eventText">
						</label>
						<label>
							Description
							<textarea mbsc-textarea id="eventDesc"></textarea>
						</label>
					</div>
					<div class="mbsc-form-group">
						<label for="allDay">
							All-day
							<input mbsc-switch id="allDay" type="checkbox">
						</label>
						<label for="eventDate">
							Starts
							<input mbsc-input id="eventDate">
						</label>
						<label>
							Ends
							<input mbsc-input id="endInput">
						</label>
						<label>
							Show as busy
							<input mbsc-segmented type="radio" name="free" value="false">
						</label>
						<label>
							Show as free
							<input mbsc-segmented type="radio" name="free" value="true">
						</label>
						<div id="eventColor"></div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		
			mobiscroll.settings = {
				lang: 'en',                                                                                                           // Specify language like: lang: 'pl' or omit setting to use default
				theme: 'ios',                                                                                                         // Specify theme like: theme: 'ios' or omit setting to use default
				themeVariant: 'light'                                                                                                 // More info about themeVariant: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-themeVariant
			};
			
			var popupInst,
				calInst,
				listInst,
				rangeInst,
				colorInst,
				preventSet,
				eventToEdit,
				allDaySwitch = document.getElementById('allDay'),
				eventTextInput = document.getElementById('eventText'),
				eventDescInput = document.getElementById('eventDesc');
			
			function saveChanges() {
				var eventToSave = {
					_id: eventToEdit._id,
					text: eventTextInput.value + getBtn(),
					desc: eventDescInput.value,
					color: colorInst.getVal(),
					allDay: allDaySwitch.checked,
					start: rangeInst.getVal()[0],
					end: rangeInst.getVal()[1],
					free: document.querySelector('input[name="free"]:checked').value == 'true'
				};
			
				calInst.updateEvent(eventToSave);
				listInst.updateEvent(eventToSave);
			}
			
			function updatePopup() {
				var event = eventToEdit,
					free = event.free ? true : false,
					oneDay = 1000 * 60 * 60 * 24,
					diff = new Date(event.end).getTime() - new Date(event.start).getTime(),
					days = Math.round(Math.abs(diff) / oneDay),
					allDay = event.allDay || days > 0;
			
				eventTextInput.value = event.text.replace(getBtn(), '');
				eventDescInput.value = event.desc || '';
				allDaySwitch.checked = allDay;
				rangeInst.setVal([event.start, event.end], true);
				rangeInst.option({
					controls: allDay ? ['date'] : ['date', 'time'],
					dateWheels: (allDay ? 'MM dd yy' : '|D M d|')
				});
				document.querySelector('input[name="free"][value=' + free + ']').checked = true;
				colorInst.setVal(event.color, true);
			}
			
			function navigate(inst, val) {
				if (inst) {
					inst.navigate(val);
				}
			}
			
			function getBtn() {
				return '<button class="mbsc-btn mbsc-btn-outline mbsc-btn-primary md-edit-btn mbsc-' + calInst.settings.theme + '">Edit</button>';
			}
			
			popupInst = mobiscroll.popup('#demo-view-update-popup', {
				display: 'center',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
				buttons: [                                                                                                            // More info about buttons: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-buttons
					'cancel',
					{
						text: 'Save',
						handler: 'set'
					}
				],
				headerText: 'Edit event',                                                                                             // More info about headerText: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-headerText
				onSet: function (event, inst) {
					saveChanges();
				}
			});
			
			rangeInst = mobiscroll.range('#eventDate', {
				controls: ['date', 'time'],
				dateWheels: '|D M d|',
				endInput: '#endInput',
				tabs: false,
				responsive: {                                                                                                         // More info about responsive: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-responsive
					large: {
						touchUi: false
					}
				}
			});
			
			calInst = mobiscroll.eventcalendar('#demo-view-update-event', {
				display: 'inline',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
				view: {                                                                                                               // More info about view: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-view
					calendar: {
						type: 'month'
					}
				},
				onSetDate: function (event, inst) {                                                                                   // More info about onSetDate: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#event-onSetDate
					if (!preventSet) {
						var day = event.date;
						navigate(listInst, day);
					}
					preventSet = false;
				}
			});
			
			listInst = mobiscroll.eventcalendar('#demo-view-update-event-list', {
				display: 'inline',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
				view: {                                                                                                               // More info about view: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-view
					eventList: { type: 'day' }
				},
				onPageChange: function (event, inst) {                                                                                // More info about onPageChange: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#event-onPageChange
					var day = event.firstDay;
					preventSet = true;
					navigate(calInst, day);
				},
				onEventSelect: function (event, inst) {                                                                               // More info about onEventSelect: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#event-onEventSelect
					if (event.domEvent.target.classList.contains('md-edit-btn')) {
						eventToEdit = event.event;
						updatePopup();
						popupInst.show();
					}
				}
			});
			
			colorInst = mobiscroll.color('#eventColor', {
				display: 'inline',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
				clear: false,
				data: ['#fff568', '#ffc400', '#ff5252', '#f48fb1', '#ba68c8', '#8c9eff', '#90caf9', '#9ccc65', '#0db057', '#bcaaa4']  // More info about data: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-data
			});
			
			document
				.getElementById('allDay')
				.addEventListener('change', function () {
					var allDay = this.checked;
			
					rangeInst.option({
						controls: allDay ? ['date'] : ['date', 'time'],
						dateWheels: (allDay ? 'MM dd yy' : '|D M d|')
					});
				});
			
			mobiscroll.util.getJson('https://trial.mobiscroll.com/events-update/', function (events) {
				for (var i = 0; i < events.length; ++i) {
					events[i].text += getBtn();
				}
				calInst.setEvents(events);
				listInst.setEvents(events);
			}, 'jsonp');
		</script>
		
		</body>
		</html>
		<body>

			<div mbsc-page class="demo-view-update-event">
				<div mbsc-form>
					<div class="mbsc-grid md-view-update-demo">
						<div class="mbsc-row mbsc-no-padding">
							<div class="mbsc-col-md-4 mbsc-col-12">
								<div id="demo-view-update-event"></div>
							</div>
							<div class="mbsc-col-md-8 mbsc-col-12 md-col-right">
								<div id="demo-view-update-event-list"></div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- <div id="demo-view-update-popup" class="md-view-update-popup">
					<div mbsc-form>
						<div class="mbsc-form-group">
							<label>
								le Pat
								<input mbsc-input id="eventText">
							</label>
							<label>
								Description
								<textarea mbsc-textarea id="eventDesc"></textarea>
							</label>
						</div>
						<div class="mbsc-form-group">
							<label for="allDay">
								All-day
								<input mbsc-switch id="allDay" type="checkbox">
							</label>
							<label for="eventDate">
								Starts
								<input mbsc-input id="eventDate">
							</label>
							<label>
								Ends
								<input mbsc-input id="endInput">
							</label>
							<label>
								Show as busy
								<input mbsc-segmented type="radio" name="free" value="false">
							</label>
							<label>
								Show as free
								<input mbsc-segmented type="radio" name="free" value="true">
							</label>
							<div id="eventColor"></div>
						</div>
					</div>
				</div> -->
			</div>
			
			<script>
			
				mobiscroll.settings = {
					lang: 'en',                                                                                                           // Specify language like: lang: 'pl' or omit setting to use default
					theme: 'ios',                                                                                                         // Specify theme like: theme: 'ios' or omit setting to use default
					themeVariant: 'light'                                                                                                 // More info about themeVariant: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-themeVariant
				};
				
				var popupInst,
					calInst,
					listInst,
					rangeInst,
					colorInst,
					preventSet,
					eventToEdit,
					allDaySwitch = document.getElementById('allDay'),
					eventTextInput = document.getElementById('eventText'),
					eventDescInput = document.getElementById('eventDesc');
				
				function saveChanges() {
					var eventToSave = {
						_id: eventToEdit._id,
						text: eventTextInput.value + getBtn(),
						desc: eventDescInput.value,
						color: colorInst.getVal(),
						allDay: allDaySwitch.checked,
						start: rangeInst.getVal()[0],
						end: rangeInst.getVal()[1],
						free: document.querySelector('input[name="free"]:checked').value == 'true'
					};
				
					calInst.updateEvent(eventToSave);
					listInst.updateEvent(eventToSave);
				}
				
				function updatePopup() {
					var event = eventToEdit,
						free = event.free ? true : false,
						oneDay = 1000 * 60 * 60 * 24,
						diff = new Date(event.end).getTime() - new Date(event.start).getTime(),
						days = Math.round(Math.abs(diff) / oneDay),
						allDay = event.allDay || days > 0;
				
					eventTextInput.value = event.text.replace(getBtn(), '');
					eventDescInput.value = event.desc || '';
					allDaySwitch.checked = allDay;
					rangeInst.setVal([event.start, event.end], true);
					rangeInst.option({
						controls: allDay ? ['date'] : ['date', 'time'],
						dateWheels: (allDay ? 'MM dd yy' : '|D M d|')
					});
					document.querySelector('input[name="free"][value=' + free + ']').checked = true;
					colorInst.setVal(event.color, true);
				}
				
				function navigate(inst, val) {
					if (inst) {
						inst.navigate(val);
					}
				}
				
				function getBtn() {
					return '<button class="mbsc-btn mbsc-btn-outline mbsc-btn-primary md-edit-btn mbsc-' + calInst.settings.theme + '">Afficher</button>';
				}
				
				popupInst = mobiscroll.popup('#demo-view-update-popup', {
					display: 'center',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
					buttons: [                                                                                                            // More info about buttons: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-buttons
						'cancel',
						{
							text: 'Save',
							handler: 'set'
						}
					],
					headerText: 'Edit event',                                                                                             // More info about headerText: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-headerText
					onSet: function (event, inst) {
						saveChanges();
					}
				});
				
				rangeInst = mobiscroll.range('#eventDate', {
					controls: ['date', 'time'],
					dateWheels: '|D M d|',
					endInput: '#endInput',
					tabs: false,
					responsive: {                                                                                                         // More info about responsive: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-responsive
						large: {
							touchUi: false
						}
					}
				});
				
				calInst = mobiscroll.eventcalendar('#demo-view-update-event', {
					display: 'inline',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
					view: {                                                                                                               // More info about view: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-view
						calendar: {
							type: 'month'
						}
					},
					onSetDate: function (event, inst) {                                                                                   // More info about onSetDate: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#event-onSetDate
						if (!preventSet) {
							var day = event.date;
							navigate(listInst, day);
						}
						preventSet = false;
					}
				});
				
				listInst = mobiscroll.eventcalendar('#demo-view-update-event-list', {
					display: 'inline',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
					view: {                                                                                                               // More info about view: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-view
						eventList: { type: 'day' }
					},
					onPageChange: function (event, inst) {                                                                                // More info about onPageChange: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#event-onPageChange
						var day = event.firstDay;
						preventSet = true;
						navigate(calInst, day);
					},
					onEventSelect: function (event, inst) {                                                                               // More info about onEventSelect: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#event-onEventSelect
						if (event.domEvent.target.classList.contains('md-edit-btn')) {
							eventToEdit = event.event;
							updatePopup();
							popupInst.show();
						}
					}
				});
				
				colorInst = mobiscroll.color('#eventColor', {
					display: 'inline',                                                                                                    // Specify display mode like: display: 'bottom' or omit setting to use default
					clear: false,
					data: ['#fff568', '#ffc400', '#ff5252', '#f48fb1', '#ba68c8', '#8c9eff', '#90caf9', '#9ccc65', '#0db057', '#bcaaa4']  // More info about data: https://docs.mobiscroll.com/4-10-3/javascript/eventcalendar#opt-data
				});
				
				document
					.getElementById('allDay')
					.addEventListener('change', function () {
						var allDay = this.checked;
				
						rangeInst.option({
							controls: allDay ? ['date'] : ['date', 'time'],
							dateWheels: (allDay ? 'MM dd yy' : '|D M d|')
						});
					});
				
				mobiscroll.util.getJson('https://trial.mobiscroll.com/events-update/', function (events) {
					for (var i = 0; i < events.length; ++i) {
						events[i].text += getBtn();
					}
					calInst.setEvents(events);
					listInst.setEvents(events);
				}, 'jsonp');
			</script>
			
			</body>
			</html>
					