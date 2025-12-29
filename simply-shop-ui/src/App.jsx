import React from 'react';
import { useEffect, useState } from "react";
import { Outlet } from "react-router-dom";
import { bootstrapAuth } from "./api/SimplyShopApi/Auth"; 

function App() {
	const [user, setUser] = useState(null);
	const [booting, setBooting] = useState(true);

	useEffect(() => {
		(async () => {
			try {
				const me = await bootstrapAuth();
				setUser(me);
			} catch {
				setUser(null);
			} finally {
				setBooting(false);
			}
		})();
	}, []);
    return (
        <div className="App">
			<Outlet context={{ user, setUser }} />
        </div>
    );
}

export default App;
