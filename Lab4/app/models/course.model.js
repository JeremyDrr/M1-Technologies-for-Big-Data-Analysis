module.exports = mongoose => {
    const Course = mongoose.model(
        "course",
        mongoose.Schema(
            {
                title: String,
                description: String,
                published: Boolean
            },
            { timestamps: true }
        )
    );
    return Course;
};