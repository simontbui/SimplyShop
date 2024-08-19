import { Container, Grid, Paper, Typography } from "@mui/material"
import { useState } from "react"
import TopNav from "../common/TopNav"
import { AvgSpentChart } from "./Cards/AvgSpentChart"
import { MostPopularStore } from "./Cards/MostPopularStore"
import { TopItemsTable } from "./Cards/TopItemsTable"

export const HomePage = () => {
    const [user, setUser] = useState({})
    const [mostPopularStore, setMostPopularStore] = useState({
        storeName: "Stater Bros.", 
        address: "55555 Magnolia St", 
        city: "Garden Grove", 
        state: "CA", 
        zip: "12345"
    })

    return (
        <>
            <TopNav />
            <Container maxWidth="lg">
                <Grid container spacing={3}>
                    <Grid item xs={12} md={9}>
                        <Paper
                            elevation={3}
                            sx={{
                            p: 2,
                            display: 'flex',
                            flexDirection: 'column',
                            height: 310,
                            }}
                        >
                        <AvgSpentChart chartType="home" />
                        </Paper>
                    </Grid>
                    <Grid item xs={12} md={3}>
                        <Paper
                            elevation={3}
                            sx={{
                            p: 2,
                            display: 'flex',
                            flexDirection: 'column',
                            height: 310,
                            }}
                        >                            
                            <MostPopularStore />
                        </Paper>
                    </Grid>
                    <Grid item xs={12} md={12}>
                        <Paper
                            elevation={3}
                            sx={{
                            p: 2,
                            display: 'flex',
                            flexDirection: 'column',
                            height: 405,
                            }}
                        >
                            <TopItemsTable />
                        </Paper>
                    </Grid>
                </Grid>
            </Container>
        </>
    )
}