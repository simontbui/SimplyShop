import { LineChart } from "@mui/x-charts"
import { Typography } from "@mui/material";
import { useState } from "react";

const chartTitles = {
    home: "Average Dollars Spent Per Visit Within a 25 mi Radius (Last 30D)",
    searchResult: "Average Cost Within a 25mi Radius (Last 30D)"
}

export const AvgSpentChart = ({ chartType }) => {
    const [avgVisitCosts, setAvgVisitCosts] = useState([
        { date: new Date(2024, 6, 1), avgCost: 535.12 },
        { date: new Date(2024, 6, 8), avgCost: 821.12 },
        { date: new Date(2024, 6, 15), avgCost: 1332.12 },
        { date: new Date(2024, 6, 22), avgCost: 3121.12 },
        { date: new Date(2024, 6, 29), avgCost: 432.12 },
        { date: new Date(2024, 7, 6), avgCost: 1173.12 },
        { date: new Date(2024, 7, 13), avgCost: 63.12 },
        { date: new Date(2024, 7, 20), avgCost: 126.12 },
        { date: new Date(2024, 7, 27), avgCost: 236.12 },
        { date: new Date(2024, 8, 3), avgCost: 312.72 },
    ])
    
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
                        data: avgVisitCosts.map((data) => data.date),
                        scaleType: "time",
                        valueFormatter: (date) => (
                            `${date.getMonth().toString()}/${date.getDate().toString()}`
                        )
                    }
                ]}
                yAxis={[
                    {
                        id: "$",
                        label: "Average Amount ($)",
                        data: avgVisitCosts.map((data) => data.avgCost),
                        scaleType: "decimal",
                        labelStyle: {
                            fill: "text.primary"
                        }                    
                    }
                ]}
                series={[
                    { 
                        data: avgVisitCosts.map((data) => data.avgCost),
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