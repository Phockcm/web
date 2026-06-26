import Button from "@/components/common/Button";

export default function AdminButton({ children, ...props }) {
  return (
    <Button 
      className="shadow-sm border border-transparent font-medium" 
      {...props}
    >
      {children}
    </Button>
  );
}
