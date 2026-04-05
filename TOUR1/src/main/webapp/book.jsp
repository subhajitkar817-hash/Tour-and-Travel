<form action="book" method="post">
    <input type="hidden" name="bus_id" value="<%= request.getParameter("bus_id") %>">

    <h2>Book Package</h2>

    <p>Select Date:</p>
    <input type="date" name="date" required><br><br>

    <p>Seats to Book:</p>
    <input type="number" name="seats" min="1" value="1" required><br><br>

    <input type="submit" value="Confirm Booking" class="btn">
</form>
