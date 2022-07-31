import "bootstrap/dist/css/bootstrap.min.css";
import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { HomePage } from "./components/homePage/homePage";

function App() {
	return (
		<BrowserRouter>
			<Routes>
				<Route path='/' element={<HomePage />}>
					<Route path='home' element={<HomePage />} />
				</Route>
			</Routes>
		</BrowserRouter>
	);
}

export default App;
