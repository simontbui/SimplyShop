import { Container, Grid, Paper } from "@mui/material"
import TopNav from "../common/TopNav"
import { useEffect, useState } from "react"
import { TopItemsTable } from "./Cards/TopItemsTable"
import { MostPopularStore } from "./Cards/MostPopularStore"
import { AvgSpentChart } from "./Cards/AvgSpentChart"
import { CheapestStoresTable } from "./Cards/CheapestStoresTable"
import { useParams } from "react-router-dom"
import { getDailyPricing } from "../../api/SimplyShopApi/Pricing"

export const SearchResultPage = () => {
    const [user, setUser] = useState({})
    const [mostPopularStore, setMostPopularStore] = useState({
        storeName: "Stater Bros.", 
        address: "55555 Magnolia St", 
        city: "Garden Grove", 
        state: "CA", 
        zip: "12345"
    });

    const [itemDailyStats, setItemDailyStats] = useState([]);

    const { item } = useParams();

    useEffect(() => {
        if (!item) {
            return;
        }

        (async () => {
            const data = await getDailyPricing(item);

            if (data) {
                setItemDailyStats(data);
            }
        })();
    }, [item])

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
                        <AvgSpentChart chartType="searchResult" data={itemDailyStats} />
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
                        <CheapestStoresTable />
                        </Paper>
                    </Grid>
                </Grid>
            </Container>
        </>
    )
}