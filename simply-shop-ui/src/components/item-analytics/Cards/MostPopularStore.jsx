import { Typography } from "@mui/material"

export const MostPopularStore = () => {
    return (
        <>
            <Typography variant="h6" color="primary" gutterBottom>Most Popular Store</Typography>
            <Typography variant="h4">Stater Bros</Typography>
            <Typography variant="h6" color="text.secondary" >8888 Chapman Ave</Typography>
            <Typography variant="h6" color="text.secondary" sx={{ flex: 1 }}>Garden Grove</Typography>
            <div>
                <Typography variant="h6" color="text.secondary">Average visit: $92.22</Typography>
            </div>
        </>
    )
}