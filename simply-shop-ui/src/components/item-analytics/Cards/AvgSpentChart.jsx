import { LineChart } from "@mui/x-charts"
import { Typography } from "@mui/material";
import { useEffect, useState } from "react";
import { getAvgSpentPerVisit } from "../../../api/SimplyShopApi/HomeAnalytics";

const chartTitles = {
    home: "Average Dollars Spent Per Visit Within a 25 mi Radius (Last 30D)",
    searchResult: "Average Cost Within a 25mi Radius (Last 30D)"
}

export const AvgSpentChart = ({ chartType }) => {
    const [avgVisitCosts, setAvgVisitCosts] = useState([
        { transactionDate: new Date(2024, 6, 1), avgSpent: 535.12 },
        { transactionDate: new Date(2024, 6, 8), avgSpent: 821.12 },
        { transactionDate: new Date(2024, 6, 15), avgSpent: 1332.12 },
        { transactionDate: new Date(2024, 6, 22), avgSpent: 3121.12 },
        { transactionDate: new Date(2024, 6, 29), avgSpent: 432.12 },
        { transactionDate: new Date(2024, 7, 6), avgSpent: 1173.12 },
        { transactionDate: new Date(2024, 7, 13), avgSpent: 63.12 },
        { transactionDate: new Date(2024, 7, 20), avgSpent: 126.12 },
        { transactionDate: new Date(2024, 7, 27), avgSpent: 236.12 },
        { transactionDate: new Date(2024, 8, 3), avgSpent: 312.72 },
    ])

    useEffect(() => {
        getAvgSpentPerVisit()
            .then(data => data?.map(day => ({
                transactionDate: new Date(day.transactionDate),
                avgSpent: day.avgSpent.toFixed(2)
            })))
            .then(data => {
                if (data) {
                    setAvgVisitCosts(data)
                }
            })
    }, [])
    
    // useEffect(() => {
    //     avgVisitCosts.forEach((x) => (
    //         console.log(x.transactionDate.getMonth().toString())
    //     ))
    // }, [avgVisitCosts])

    return (
        <div>
            <Typography variant="h6" color="primary">
                {chartTitles[chartType]}
            </Typography>
            <LineChart 
                margin={{
                top: 16,
                right: 20,
                left: 70,
                }}
                xAxis={[
                    { 
                        id: "Date",
                        label: "Date",
                        data: avgVisitCosts?.map((data) => data.transactionDate),
                        scaleType: "time",
                        valueFormatter: (date) => (
                            `${(date.getMonth()+1).toString()}/${date.getDate().toString()}`
                        )
                    }
                ]}
                yAxis={[
                    {
                        id: "$",
                        label: "Average Amount ($)",
                        data: avgVisitCosts?.map((data) => data.avgSpent),
                        scaleType: "decimal",
                        labelStyle: {
                            fill: "text.primary"
                        }                    
                    }
                ]}
                series={[
                    { 
                        data: avgVisitCosts?.map((data) => data.avgSpent),
                        labelStyle: {
                            fill: "text.primary"
                        }
                    }
                ]}
                height={280}
                width={800}
                sx={{ 
                    "& .MuiChartsAxis-left .MuiChartsAxis-label": {
                        transform: "translateX(-20px) !important"
                    },
                    "& .MuiChartsAxis-label": {
                        fontWeight: "medium"
                    }
                }}
            />
        </div>
    )
}