export class Cart {
   id!: number;
   userID!: number;
   total!: number;
   total_qty!: number;
   created_at!: string;
   modified_at!: string;
}

export class Order {
   id!: number;
   user!: number;
   total!: number;
   total_qty!: number;
   created_at!: string;
   modified_at!: string;
}


