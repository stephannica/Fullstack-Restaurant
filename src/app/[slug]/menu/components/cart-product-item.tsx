import { ChevronLeftIcon, ChevronRightIcon, TrashIcon } from "lucide-react";
import Image from "next/image";

import { Button } from "@/components/ui/button";
import { formatCurrency } from "@/helpers/format-currency";

import { CartProduct } from "../contexts/cart";

interface CartProductItemProps {
    product: CartProduct;
}

const CartProductItem = ({product}: CartProductItemProps) => {
    return ( 
        <div className="flex items-center justify-between">
            {/* ESQUERDA */}
            <div className="flex items-center gap-3">
                <div className="relative h-20 w-20 bg-gray-100 rounded-lg">
                    <Image src={product.imageUrl} alt={product.name} fill/>
                </div>

                <div className="space-y-1">
                    <p className="text-xs max-w-[90%] truncate text-ellipsis">{product.name}</p>
                    <p className="text-sm font-semibold">{formatCurrency(product.price)}</p>
                    <div className="flex items-center gap-1 text-center">
                        <Button variant="outline" className="w-7 h-7 rounded-lg">
                            <ChevronLeftIcon />
                        </Button>
                        <p className="w-7 text-xs">{product.quantity}</p>
                        <Button variant="destructive" className="w-7 h-7 rounded-lg">
                            <ChevronRightIcon />
                        </Button>
                    </div>
                </div>
            </div>

            {/* BOTÃO DE DELEÇÃO */}
            <Button variant="outline" className="w-7 h-7 rounded-lg">
                <TrashIcon />
            </Button>
        </div>
     );
}
 
export default CartProductItem;