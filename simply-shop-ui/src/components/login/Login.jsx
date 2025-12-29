import React, { useState } from "react";
import {
	Avatar,
	Button,
	TextField,
	FormControlLabel,
	Checkbox,
	Link,
	Grid,
	Box,
	Typography,
	Container,
	Paper,
} from "@mui/material";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import { useOutletContext, useNavigate } from "react-router-dom";
import { loginUser, whoAmI } from "../../api/SimplyShopApi/Auth";

const Login = () => {
	const { setUser } = useOutletContext();
	const navigate = useNavigate();

	const [form, setForm] = useState({
		email: "",
		password: "",
		remember: false,
	});

	const handleChange = (e) => {
		const { name, value, type, checked } = e.target;
		setForm((prev) => ({
			...prev,
			[name]: type === "checkbox" ? checked : value,
		}));
	};

	const handleLoginSubmit = async (event) => {
		event.preventDefault();
		try {
			const loginResponse = await loginUser(form.email, form.password);
			const me = await whoAmI();
			setUser(me);
			navigate("/")
		} catch (e) {
			console.error("Login Failed", e);
		}
	};

	return (
		<Container component="main" maxWidth="xs">
			<Box
				sx={{
					minHeight: "100vh",
					display: "flex",
					alignItems: "center",
					justifyContent: "center",
				}}
			>
				<Paper elevation={3} sx={{ p: 4, width: "100%" }}>
					<Box
						sx={{
							display: "flex",
							flexDirection: "column",
							alignItems: "center",
							mb: 2,
						}}
					>
						<Avatar sx={{ m: 1 }}>
							<LockOutlinedIcon />
						</Avatar>
						<Typography component="h1" variant="h5">
							Sign in
						</Typography>
					</Box>

					<Box component="form" noValidate onSubmit={handleLoginSubmit}>
						<TextField
							margin="normal"
							required
							fullWidth
							id="email"
							label="Email Address"
							name="email"
							autoComplete="email"
							autoFocus
							value={form.email}
							onChange={handleChange}
						/>

						<TextField
							margin="normal"
							required
							fullWidth
							name="password"
							label="Password"
							type="password"
							id="password"
							autoComplete="current-password"
							value={form.password}
							onChange={handleChange}
						/>

						<FormControlLabel
							control={
								<Checkbox
									name="remember"
									color="primary"
									checked={form.remember}
									onChange={handleChange}
								/>
							}
							label="Remember me"
						/>

						<Button
							type="submit"
							fullWidth
							variant="contained"
							sx={{ mt: 2, mb: 2 }}
						>
							Sign In
						</Button>

						<Grid container>
							<Grid item xs>
								<Link href="#" variant="body2">
									Forgot password?
								</Link>
							</Grid>
							<Grid item>
								<Link href="#" variant="body2" onClick={() => navigate("/register")}>
									{"Don't have an account? Sign Up"}
								</Link>
							</Grid>
						</Grid>
					</Box>
				</Paper>
			</Box>
		</Container>
	);
}

export default Login