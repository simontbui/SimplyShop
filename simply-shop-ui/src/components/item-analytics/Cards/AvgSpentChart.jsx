import { LineChart } from "@mui/x-charts"
import { Typography } from "@mui/material";
import { useEffect, useState } from "react";
import { getAvgSpentPerVisit } from "../../../api/SimplyShopApi/Pricing";

const chartTitles = {
    home: "Average Dollars Spent Per Visit Within a 25 mi Radius (Last 30D)",
    searchResult: "Average Cost Within a 25mi Radius (Last 30D)"
}

export const AvgSpentChart = ({ chartType, data }) => {
    const [avgVisitCosts, setAvgVisitCosts] = useState([
    ])

    useEffect(() => {
        if (chartType === "searchResult") {
            const avgVisitData = data?.map(day => ({
                transactionDate: new Date(day.transactionDay),
                avgSpent: Number(day.avgUnitCost).toFixed(2)
            }));

            setAvgVisitCosts(avgVisitData);
            return;
        }

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
    }, [chartType, data])
    
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