import { Table, TableHead, TableCell, TableRow, TableBody, Typography } from "@mui/material"
import { useState } from "react"

export const TopItemsTable = () => {
    const [top10Items, setTop10Items] = useState([
        { id: 1, name: "Apples", costPerUnit: "1.99" },
        { id: 2, name: "Oranges", costPerUnit: "11.99" },
        { id: 3, name: "Bananas", costPerUnit: "3.99" },
        { id: 4, name: "Milk", costPerUnit: "5.99" },
        { id: 5, name: "Egg", costPerUnit: "14.99" },
        { id: 6, name: "Yogurt", costPerUnit: "15.99" },
        { id: 7, name: "Cheese", costPerUnit: "0.99" },
        { id: 8, name: "Ribeye", costPerUnit: "8.99" },
        { id: 9, name: "Apples", costPerUnit: "22.99" },
        { id: 10, name: "Eggplant", costPerUnit: "17.99" }
    ])

    return (
        <div>
            <Typography variant="h6" color="primary" gutterBottom>Most Purchased Items (25 mi radius)</Typography>
            <Table size="small">
                <TableHead>
                    <TableCell>Item Name</TableCell>
                    <TableCell>Cost Per Unit ($)</TableCell>
                </TableHead>
                <TableBody>
                    {top10Items.map((item) => (
                        <TableRow key={item.id}>
                            <TableCell>{item.name}</TableCell>
                            <TableCell>{item.costPerUnit}</TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </div>
    )
}