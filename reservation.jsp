<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<title>Document</title>
</head>
<body>

	<header class="text-gray-600 body-font">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
			<a
				class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none"
					stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2"
					class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full"
					viewBox="0 0 24 24">
              <path
						d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
            </svg> <span class="ml-3 text-xl">MOM's Kitchen</span>
			</a>
			<nav
				class="md:mr-auto md:ml-4 md:py-1 md:pl-4 md:border-l md:border-gray-400	flex flex-wrap items-center text-base justify-center">
				<a class="mr-5 hover:text-gray-900" href="index.html">Home</a> <a
					class="mr-5 hover:text-gray-900" href="about.html">About us</a> <a
					class="mr-5 hover:text-gray-900" href="place_order.jsp">Order</a> <a
 					class="mr-5 hover:text-gray-900" href="reservation.jsp">Reservation</a>			
 			</nav>
			 <a href = "loginPage.jsp">
          <button type = "submit" class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0">Login
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
              <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
          </button>
          </a>
          
          <a href = "logout.jsp">
          <button type = "submit" class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"> Logout
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
              <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
          </button>
          </a>
		</div>
	</header>
	<section class="text-gray-600 body-font">
		<div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
			<div
				class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
				<h2 class="text-gray-900 text-lg font-medium title-font mb-5">Reservation</h2>
				<form action = "reservationNext.jsp">
				<div class="relative mb-4">
					<label for="full_name" class="leading-7 text-sm text-gray-600">Full
						Name (Only Alphabets Accepted)</label> <input type="text" id="full_name" name="full_name"
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" pattern="^[a-zA-Z\s]+$" required>
				</div>
				<div class="relative mb-4">
					<label for="email" class="leading-7 text-sm text-gray-600">Email</label>
					<input type="email" id="email" name="email"
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" required>
				</div>
				<div class="relative mb-4">
					<label for="phoneNo" class="leading-7 text-sm text-gray-600">Contact
						Number</label> <input type="text" id="phoneNo" name="phoneNo" placeholder="03xxxxxxxxx" pattern="03[0-9]{2}(?!1234567)(?!1111111)(?!7654321)[0-9]{7}"
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" required>
				</div>
				<div class="relative mb-4">
					<label for="persons" class="leading-7 text-sm text-gray-600">Number
						of Persons</label> <input type="number" id="persons" name="persons" min = "1" 
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" required>
				</div>
				<div>
				<label for="appt" class="leading-7 text-sm text-gray-600">Select time:
				</label> <input type="time" id="appt" name="appt" required> 
				</div>
				<div>
					<label for="date">Reservation Date:</label> <input type="date"
						id="date" name="date" value="2022-12-05" min="2022-12-05"
						max="2022-12-12" required>
				</div>
				<button
					class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Submit
					Request</button>
					</form>
				<p class="text-xs text-gray-500 mt-3">Reservations get canceled
					after 15 minutes late arrival</p>
			</div>
		</div>
	</section>
	
	<img src="olive.jpg" width="100%" height="100%">
</body>
</html>