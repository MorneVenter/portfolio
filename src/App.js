import "App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { Sidebar } from "components/sidebar/sidebar";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { AppRoutes } from "shared/routes";
import { HomePage } from "./components/homePage/homePage";

function App() {
	return (
		<>
			<Sidebar />
			<BrowserRouter>
				<Routes>
					<Route path='/' element={<HomePage />}>
						<Route path={AppRoutes.Home} element={<HomePage />} />
						<Route path={AppRoutes.Contact} element={<HomePage />} />
					</Route>
				</Routes>
			</BrowserRouter>
		</>
	);
}

export default App;
