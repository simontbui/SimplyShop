import { Box, Button, Container, Grid, IconButton, Paper, Typography } from "@mui/material"
import TopNav from "../common/TopNav"
import { useState } from "react"
import { DataGrid } from "@mui/x-data-grid"
import AddIcon from '@mui/icons-material/Add'
import DeleteIcon from '@mui/icons-material/Delete'

export const ProductSubmissionForm = () => {
    const [items, setItems] = useState([
        { id: 1, productName: "Lettuce", count: 5, price: 3.99 },
        { id: 2, productName: "Apples", count: 7, price: 1.99 },
        { id: 3, productName: "Tomatoes", count: 8, price: 8.99 },
        { id: 4, productName: "Cheese", count: 2, price: 9.99 }
    ])

    let numItems = items.length;

    const handleAddItemsClick = () => {
        numItems++

        setItems([
            ...items,
            { id: numItems, productName: "", count: 1, price: 0 }
        ])
    }

    const onRemoveClick = (rowId) => {
        setItems(items.filter((item) => item.id !== rowId))
    }

    const columns = [
        { field: "productName", headerName: "Name", width: 760, editable: true},
        { 
            field: "count", 
            headerName: "Count", 
            type: "number", 
            editable: true, 
            align: "center", 
            headerAlign: "center"
        },
        { 
            field: "price", 
            headerName: "Price", 
            type: "decimal", 
            editable: true, 
            align: "center", 
            headerAlign: "center"
        },
        {
            field: "actions",
            type: "actions",
            headerName: "Remove",
            cellClassName: "actions",
            renderCell: (params) => {
                return (
                    <IconButton onClick={() => onRemoveClick(params.row.id)}>
                        <DeleteIcon />
                    </IconButton>
                )
            }
        }
    ]

    return (
        <>
            <TopNav />
            <Container>
                <Paper elevation={3} sx={{ py: 5, px: 5 }}>
                    <Typography
                        variant="h4"
                        color="textPrimary"
                        sx={{ textAlign: "center"}}
                    >
                        Submit your purchased items below
                    </Typography>
                    <DataGrid 
                        rows={items} 
                        columns={columns} 
                        disableRowSelectionOnClick
                        sx={{ my: 3 }}
                    />
                    <Button 
                        color="primary" 
                        variant="outlined" 
                        startIcon={<AddIcon />} 
                        onClick={handleAddItemsClick}
                    >
                        Add item
                    </Button>
                    <IconButton 
                        onClick={() => onRemoveClick()}
                    >
                        <DeleteIcon />
                    </IconButton>
                </Paper>
                <Box textAlign="center" sx={{ my: 3 }}>
                    <Button textAlign="center" variant="contained" sx={{ width: "10%" }}>
                        SUBMIT
                    </Button>
                </Box>
            </Container>
        </>
    )
}