import React, { useState } from "react";
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import Menu from '@mui/material/Menu';
import MenuIcon from '@mui/icons-material/Menu';
import Container from '@mui/material/Container';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import Tooltip from '@mui/material/Tooltip';
import MenuItem from '@mui/material/MenuItem';
import AdbIcon from '@mui/icons-material/Adb';
import { useNavigate, useOutletContext } from 'react-router-dom';
import { ItemSearch } from './ItemSearch';

const pages = ['Home', 'Submit Purchases', 'Add New Product', 'Add New Store'];
const settings = ['Login', 'Profile', 'Account', 'Dashboard', 'Logout'];

const TopNav = () => {
	const { user } = useOutletContext();
	const navigate = useNavigate();
	const navLinks = { 
		'Home': '/', 
		// 'Upload your receipt': '/item-input', 
		'Submit Purchases': '/item-submission'}

	const [anchorElNav, setAnchorElNav] = useState(null);
	const [anchorElUser, setAnchorElUser] = useState(null);

	const handleOpenNavMenu = (event) => {
		setAnchorElNav(event.currentTarget);
	};
	const handleOpenUserMenu = (event) => {
		setAnchorElUser(event.currentTarget);
	};

	const handleCloseNavMenu = () => {
		setAnchorElNav(null);
	};

	const handleCloseUserMenu = () => {
		setAnchorElUser(null);
	};

	const handleLogout = () => {
		console.log("Logging out...");
	}

	const isAuthenticated = user !== null;

	const userMenuItems = isAuthenticated
		? [
			{ label: 'Profile', onClick: () => navigate('/profile') },
			{ label: 'Account', onClick: () => navigate('/account') },
			{ label: 'Dashboard', onClick: () => navigate('/dashboard') },
			{ label: 'Logout', onClick: handleLogout },
		]
		: [
			{ label: 'Login', onClick: () => navigate('/login') },
		];

	return (
		<AppBar position="relative" sx={{ mb: 5 }}>
		<Container maxWidth="xl">
			<Toolbar disableGutters>
			<AdbIcon sx={{ display: { xs: 'none', md: 'flex' }, mr: 1 }} />
			<Typography
				variant="h6"
				noWrap
				component="a"
				href="/"
				sx={{
				mr: 2,
				display: { xs: 'none', md: 'flex' },
				fontFamily: 'monospace',
				fontWeight: 700,
				letterSpacing: '.3rem',
				color: 'inherit',
				textDecoration: 'none',
				}}
			>
				Simply Shop
			</Typography>

			<Box sx={{ flexGrow: 1, display: { xs: 'flex', md: 'none' } }}>
				<IconButton
					size="large"
					aria-label="account of current user"
					aria-controls="menu-appbar"
					aria-haspopup="true"
					onClick={handleOpenNavMenu}
					color="inherit"
				>
					<MenuIcon />
				</IconButton>
				<Menu
				id="menu-appbar"
				anchorEl={anchorElNav}
				anchorOrigin={{
					vertical: 'bottom',
					horizontal: 'left',
				}}
				keepMounted
				transformOrigin={{
					vertical: 'top',
					horizontal: 'left',
				}}
				open={Boolean(anchorElNav)}
				onClose={handleCloseNavMenu}
				sx={{
					display: { xs: 'block', md: 'none' },
				}}
				>
				{pages.map((page) => (
					<MenuItem key={page} onClick={handleCloseNavMenu}>
					<Typography align="center">{page}</Typography>
					</MenuItem>
				))}
				</Menu>
			</Box>
			<AdbIcon sx={{ display: { xs: 'flex', md: 'none' }, mr: 1 }} />
			<Typography
				variant="h5"
				noWrap
				component="a"
				href="#app-bar-with-responsive-menu"
				sx={{
				mr: 2,
				display: { xs: 'flex', md: 'none' },
				flexGrow: 1,
				fontFamily: 'monospace',
				fontWeight: 700,
				letterSpacing: '.3rem',
				color: 'inherit',
				textDecoration: 'none',
				}}
			>
				LOGO
			</Typography>
			<Box sx={{ display: { xs: 'none', md: 'flex' }, gap: 2 }}>
				{pages.map((page) => (
					<Button
						key={page}
						onClick={() => navigate(navLinks[page])}
						sx={{
							my: 2,
							color: 'white',
							fontWeight: 500,
							textTransform: 'none',
						}}
					>
						{page}
					</Button>
				))}
			</Box>
			<Box sx={{ flexGrow: 1 }} />
			<Box
				sx={{
					display: { xs: 'none', md: 'flex' },
					flexBasis: 400,
					maxWidth: 500,
					ml: 4,
				}}
			>
				<ItemSearch />
			</Box>

			<Box sx={{ flexGrow: 0 }}>
				<Tooltip title="Open settings">
				<IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
					<Avatar alt="Remy Sharp" src="/static/images/avatar/2.jpg" />
				</IconButton>
				</Tooltip>
				<Menu
				sx={{ mt: '45px' }}
				id="menu-appbar"
				anchorEl={anchorElUser}
				anchorOrigin={{
					vertical: 'top',
					horizontal: 'right',
				}}
				keepMounted
				transformOrigin={{
					vertical: 'top',
					horizontal: 'right',
				}}
				open={Boolean(anchorElUser)}
				onClose={handleCloseUserMenu}
				>

				{userMenuItems.map((item) => (
					<MenuItem
						key={item.label}
						onClick={() => {
							handleCloseUserMenu();
							item.onClick && item.onClick();
						}}
					>
						<Typography textAlign="center">
							{item.label}
						</Typography>
					</MenuItem>
				))}
				</Menu>
			</Box>
			</Toolbar>
		</Container>
		</AppBar>
	);
}

export default TopNav