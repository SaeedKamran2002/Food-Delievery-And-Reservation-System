<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<script>
	app.js
</script>
<title>Document</title>
</head>
<body>


	<section class="text-gray-600 body-font">
		<div class="absolute inset-0 bg-gray-300">
			
		</div>
		<div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
			<div class="lg:w-3/5 md:w-1/2 md:pr-16 lg:pr-0 pr-0">

			</div>
			<div
				class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
				<h2 class="text-gray-900 text-lg font-medium title-font mb-5">Log
					in</h2>
				<div class="relative mb-4">
					<form action="loginCheck.jsp">
						<div class="relative mb-4">
							<label for="email" class="leading-7 text-sm text-gray-600">Email</label>
							<input type="email" id="email" name="email"
								class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
						</div>
						
						<div class="relative mb-4">
							<label for="full-name" class="leading-7 text-sm text-gray-600">Password</label>
							<input type="password" id="password" name="password"
								class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
						</div>
						<button
							class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Sign
							in</button>
					</form>
					<br> <br> <br>
					<form action="signUp.jsp">
						<button
							class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Sign
							up</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>