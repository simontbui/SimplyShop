import { Table, TableHead, TableCell, TableRow, TableBody, Typography } from "@mui/material"
import { useState } from "react"

export const CheapestStoresTable = () => {
    const [stores, setStores] = useState([
        { id: 1, name: "Stater Bros", avgCost: "1.54", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 2, name: "Food 4 Less", avgCost: "1.68", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 3, name: "Albertsons", avgCost: "1.99", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 4, name: "Stater Bros", avgCost: "2.01", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 5, name: "Whole Foods", avgCost: "2.06", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 6, name: "Yogurt", avgCost: "2.08", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 7, name: "Walmart", avgCost: "3.05", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 8, name: "Target", avgCost: "3.33", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 9, name: "Target", avgCost: "4.45", address: "11111 Wrong St, Los Angeles, CA 90001" },
        { id: 10, name: "Sprouts", avgCost: "5.56", address: "11111 Wrong St, Los Angeles, CA 90001" }
    ])

    return (
        <div>
            <Typography variant="h6" color="primary" gutterBottom>Cheapest Stores (25mi radius)</Typography>
            <Table size="small">
                <TableHead>
                    <TableCell>Store Name</TableCell>
                    <TableCell>Average Cost Per Unit</TableCell>
                    <TableCell>Address</TableCell>
                </TableHead>
                <TableBody>
                    {stores.map((store) => (
                        <TableRow key={store.id}>
                            <TableCell>{store.name}</TableCell>
                            <TableCell>{store.avgCost}</TableCell>
                            <TableCell>{store.address}</TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </div>
    )
}