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
	</header>
	<section class="text-gray-600 body-font">
		<div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
			<div
				class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
				<h2 class="text-gray-900 text-lg font-medium title-font mb-5">Make an account</h2>
				<form action = "signUpCheck.jsp">
				<div class="relative mb-4">
					<label for="first_name" class="leading-7 text-sm text-gray-600">First
						Name (Only Alphabets Accepted)</label> <input type="text" id="first_name" name="first_name" 
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" pattern="^[a-zA-Z]+$" required>
				</div>
				<div class="relative mb-4">
					<label for="last_name" class="leading-7 text-sm text-gray-600">Last
						Name (Only Alphabets Accepted)</label> <input type="text" id="last_name" name="last_name"
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" pattern="^[a-zA-Z]+$" required>
				</div>
				<div class="relative mb-4">
					<label for="email" class="leading-7 text-sm text-gray-600">Email</label>
					<input type="email" id="email" name="email"
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" required>
				</div>
				
				<div class="relative mb-4">
						<label for="password" class="leading-7 text-sm text-gray-600">Password </label> <input type="password" id="password" 
							name="password"
							class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" required>
					</div>
				<div class="relative mb-4">
					<label for="phoneNo" class="leading-7 text-sm text-gray-600">Contact
						Number</label> <input type="text" id="phoneNo" name="phoneNo" placeholder="03xxxxxxxxx"
						class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" pattern="03[0-9]{2}(?!1234567)(?!1111111)(?!7654321)[0-9]{7}" required>
				</div>
					
					<button
					class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Sign Up
					</button>
					</form>
					
			</div>
		</div>
	</section>
</body>
</html>