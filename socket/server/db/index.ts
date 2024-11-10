import mysql from 'mysql2/promise'

const config = useRuntimeConfig();


interface Options {
    query: string;
    values?: any[];
}


const pool = mysql.createPool({
    host: config.DB_HOST,
    user: config.DB_USERNAME,
    password: config.DB_PASSWORD,
    database: config.DB_DATABASE,
});

export const sql = async ({query, values}: Options) => {

    const [rows] = await pool.query(query, values);
    return rows;
}

