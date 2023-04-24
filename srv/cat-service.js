module.exports = (srv) => {

    const { Order } = cds.entities('my.salesorder')

    srv.before('CREATE', 'Order', async (req) => {
        const order = req.data

        if (!order.amount || order.amount <= 0) return req.error(400, 'Order at least 1 quantity')
        const tx = cds.transaction(req)
        const affectedRow = await tx.run(
            UPDATE(Customer)
                .set({ totalOrder: { '+=': order.amount } })
                .where({ totalOrder: { '>=': order.amount }, orderID: order.ID })
        )
    })
}