import { Search } from "@mui/icons-material"
import { IconButton, TextField } from "@mui/material"
import { useState } from "react"
import { useNavigate } from "react-router-dom"

export const ItemSearch = () => {
    const navigate = useNavigate()
    const [searchItem, setSearchItem] = useState("")

    const onSearchChange = (e) => {
        setSearchItem(e.target.value)
    }

    const handleSearchEnterPress = (e) => {
        if (e.key === "Enter") {
            navigate("/search-results")
        }
    }

    const handleSearchClick = () => {
        navigate("/search-results")
    }

    return (
        <>
            <TextField 
                placeholder="Enter product name"
                size="small"
                variant="outlined"
                type="search"
                color="error"
                sx={{ 
                    "& .MuiInputBase-root": { backgroundColor: "white" },
                    pt: 0, mt: 2, width: "25%"
                }}
                onChange={(e) => onSearchChange(e)}
                onKeyDown={(e) => handleSearchEnterPress(e)}
            />
            <IconButton 
                type="submit" 
                aria-label="search"
                onClick={handleSearchClick}
            >
                <Search style={{ fill: "black" }} sx={{ mt: 1 }} />
            </IconButton>
        </>
    )
}